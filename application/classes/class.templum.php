<?php

define("TEMPLUM_VERSION", "0.4.0");

class TemplumError extends Exception {

	public function TemplumError($message, $code = 0) {
		parent::__construct($message, $code);
	}

}

class TemplumTemplateError extends Exception {
	
	protected $template = NULL;

	public function TemplumTemplateError($message, $code = 0, $template = NULL) {
		$this->template = $template;
		parent::__construct($message, $code);
	}

	public function getTemplate() {
		return($this->template);
	}

}

class Templum {
	
	public function Templum($templatePath, $varsUniversal = array(), $locale = NULL) {
		if (!file_exists($templatePath)) {
			throw new TemplumError("No such file or directory: $templatePath", 1);
		}
		if (!is_dir($templatePath)) {
			throw new TemplumError("Not a directory: $templatePath", 2);
		}
		$this->templatePath = rtrim(realpath($templatePath), '/');
		$this->varsUniversal = $varsUniversal;
		$this->locale = $locale;
		$this->autoEscape = True;
		$this->cache = array();
	}

	public function setVar($varName, $varValue) {
		$this->varsUniversal[$varName] = $varValue;
	}

	public function setAutoEscape($escape = True) {
		$this->autoEscape = $escape;
	}

	public function setLocale($locale) {
		$this->locale = $locale;
	}

	public function template($path, $varsGlobal = array(), $autoEscape = NULL) {
		$fpath = $this->templatePath . '/' . trim($path, '/').'.tpl';
		if ($autoEscape === NULL) {
			$autoEscape = $this->autoEscape;
		}

		if (!empty($this->locale)) {
			$fpathTrans = realpath($fpath.'.'.$this->locale);
			if ($fpathTrans !== False) {
				if (array_key_exists($fpathTrans, $this->cache)) {
					return($this->cache[$fpathTrans]);
				} else {
					if (file_exists($fpathTrans)) {
						$fpath = $fpathTrans;
					}
				}
			}
		} else {
			$rpath = realpath($fpath);
			if($rpath === False) {
				throw new TemplumError("Template not found or not a file: $fpath", 3);
			}
			if (array_key_exists($rpath, $this->cache)) {
				return($this->cache[$rpath]);
			}
			$fpath = $rpath;
		}

		if (!is_file($fpath)) {
			throw new TemplumError("Template not found or not a file: $fpath", 3);
		}
		if (!is_readable($fpath)) {
			throw new TemplumError("Template not readable: $fpath", 4);
		}

		$template = new TemplumTemplate(
				$this,
				$fpath,
				$this->compile(file_get_contents($fpath), $autoEscape), 
				array_merge($this->varsUniversal, $varsGlobal)
			);
		$this->cache[$fpath] = $template;
		return($template);
	}
	
	public static function templateFromString($contents, $autoEscape = Null) {
		if ($autoEscape === Null) {
			$autoEscape = $this->autoEscape;
		}

		$template = new TemplumTemplate(
				NULL,
				"FROM_STRING",
				$this->compile($contents, $autoEscape), 
				array()
			);
		return($template);
	}

	private function compile($contents, $autoEscape = True) {
		$contents = preg_replace(
			array(
				"/{{/", 
				"/}}\n/", 
				"/}}/", 
				"/\[\[/", 
				"/\]\]/",
				'/^\s*@(.*)$/m',
				'/\[:\s*block\s(.*)\s*:\](.*)\[:\s*endblock\s*:\]/Usm',
				),
			array(
				$autoEscape ? "<?php echo(htmlspecialchars(" : "<?php echo(", 
				$autoEscape ? ")); ?>\n\n" : "); ?>\n\n",
				$autoEscape ? ")); ?>" : "); ?>",
				"<?php ",
				" ?>",
				"<?php \\1 ?>",
				"<?php if (array_key_exists('\\1', \$this->inheritBlocks)) { print(\$this->inheritBlocks['\\1']); } else if (\$this->inheritFrom === NULL) { ?>\\2<?php } else { ob_start(); ?>\\2<?php \$this->inheritBlocks['\\1'] = ob_get_contents(); ob_end_clean(); } ?>",
				),
			$contents
		);
		return($contents);
	}
}

class TemplumTemplate {

	public function TemplumTemplate($templum, $filename, $contents, $varsGlobal = array()) {
		$this->templum = $templum;
		$this->filename = $filename;
		$this->contents = $contents;
		$this->varsGlobal = $varsGlobal;
		$this->inheritFrom = NULL; 
		$this->inheritBlocks = array();
	}

	public function setVar($varName, $varValue) {
		$this->varsGlobal[$varName] = $varValue;
	}

	public function render($varsLocal = array()) {

		extract($this->varsGlobal);
		extract($varsLocal);

		ob_start();

		$this->errorHandlerOrig = set_error_handler(array($this, 'errorHandler'));
		eval("?>" . $this->contents);
		restore_error_handler();

		$result = ob_get_contents();
		ob_end_clean();

		if ($this->inheritFrom !== NULL) {
			$this->inheritFrom->inheritBlocks = $this->inheritBlocks;
			$result = $this->inheritFrom->render();
		}

		return($result);
	}

	public function errorHandler($nr, $string, $file, $line) {

		restore_error_handler();
		ob_end_clean();
		throw new TemplumTemplateError("$string (file: {$this->filename}, line $line)", 1, $this);

	}

	public function inc($template, $varsLocal = array()) {
		if (!isset($this->templum)) {
			throw new TemplumTemplateError("Cannot include templates in a TemplumTemplate instance created from a string.", 2, $this);
		}
		$t = $this->templum->template($template, $varsLocal);
		print($t->render());
	}

	public function inherit($template) {
		$this->inheritFrom = $this->templum->template($template);
	}
}