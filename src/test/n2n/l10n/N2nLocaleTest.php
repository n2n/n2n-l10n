<?php

namespace n2n\l10n;

use PHPUnit\Framework\TestCase;

class N2nLocaleTest extends TestCase{

	/**
	 * @throws IllegalN2nLocaleFormatException
	 */
	function testParseWebId() {
		$this->assertSame('de_CH', N2nLocale::parseWebId('de-ch'));
		$this->assertSame('de', N2nLocale::parseWebId('de'));
	}

	/**
	 * @throws IllegalN2nLocaleFormatException
	 */
	function testParseWebIdWithAlias() {
		N2nLocale::setWebAliases(['holeradio' => new N2nLocale('de_CH')]);

		$this->assertSame('it_CH', N2nLocale::parseWebId('it-ch'));
		$this->assertSame('de_CH', N2nLocale::parseWebId('holeradio'));
	}

	/**
	 * @throws IllegalN2nLocaleFormatException
	 */
	function testParseWebIdFailToLong() {
		$this->expectException(IllegalN2nLocaleFormatException::class);
		N2nLocale::parseWebId('de-ch23');
	}

	/**
	 * @throws IllegalN2nLocaleFormatException
	 */
	function testParseWebIdFailToShort() {
		$this->expectException(IllegalN2nLocaleFormatException::class);
		N2nLocale::parseWebId('d');
	}
}