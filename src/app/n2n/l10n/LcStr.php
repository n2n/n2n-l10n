<?php

namespace n2n\l10n;

use n2n\util\magic\MagicContext;

interface LcStr {

	function t(MagicContext $magicContext, ?N2nLocale $n2nLocale = null): string;
}