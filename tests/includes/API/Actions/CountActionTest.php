<?php

use Waca\API\Actions\CountAction;

class CountActionTest extends PHPUnit_Framework_TestCase
{
	private $count;

	public function setUp() {
		$count = new CountAction();

		$this->count = $count;

		$this->assertInstanceOf(CountAction::class, $count);
	}

	public function tearDown() {
		unset($count);
	}
}
