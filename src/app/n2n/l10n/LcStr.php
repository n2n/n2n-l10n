<?php

namespace n2n\l10n;

use n2n\util\magic\MagicContext;

interface LcStr extends \Stringable {

	function composeString(MagicContext $magicContext, ?N2nLocale $n2nLocale = null): string;
}