<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

Route::get('/', 'UsersController@getLogin');

Route::get('/e/o/{pool_id}/{email_id}/{date}', 'EmailController@getOpen');
Route::get('/e/c/{pool_id}/{email_id}/{date}/{link_id?}', 'EmailController@getClick');
Route::get('/e/u/{pool_id}/{email_id}/{date}', 'EmailController@getUnsubscribe');
Route::post('/e/u/{pool_id}/{email_id}/{date}', 'EmailController@postUnsubscribe');

Route::controller('/home', 'Home');
Route::controller('/users', 'UsersController');
Route::controller('/email', 'EmailController');
Route::controller('/prospect', 'ProspectController');
Route::any('/find', array('as' => 'find', 'uses' => 'FindController@getIndex'));

//Admin routes
Route::controller('/admin/school-directory', 'SchoolDirectoryController');
Route::controller('/admin', 'AdminController');

//API routes
Route::when('api/*', 'auth.basic');
Route::when('api/*', 'api');

Route::controller('/api/application', 'ApplicationController');
Route::controller('/api/authorize', 'AuthorizeController');
Route::controller('/api/users', 'UsersApiController');
Route::controller('/callback', 'CallbackApi');
