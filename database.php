<?php
const DB_HOST = 'lujzag.com.mysql';
const DB_USER = 'lujzag_com';
const DB_PASS = 'et4JKEVn';
const DB_NAME = 'lujzag_com';

$link = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
if ($link->connect_error) { 
   die('Connect Error ('	.$link->connect_errno.') '.$link->connect_error);
}
$link->set_charset("utf8"); 
?>