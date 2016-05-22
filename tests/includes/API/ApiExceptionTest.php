<?php

/**
 * Created by PhpStorm.
 * User: Matthew
 * Date: 5/21/16
 * Time: 22:35
 */

use \Waca\API\ApiException;

class ApiExceptionTest extends PHPUnit_Framework_TestCase
{
	private $message;
	private $exception;

	public function setUp() {
		$this->message = "This is a test ApiException.";

		try {
			throw new ApiException($this->message);
		}
		catch(ApiException $e) {
			$this->exception = $e;
		}
	}

	public function tearDown() {
		unset($this->exception);
	}

	public function testMessage() {
		$this->assertEquals($this->message, $this->exception->getMessage());
		$this->assertNotEquals(null, $this->exception->getMessage());
		$this->assertNotEquals("", $this->exception->getMessage());
	}
}
