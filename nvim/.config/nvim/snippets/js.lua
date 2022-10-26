return {
	s({trig = '// es$', regTrig = true}, t('// eslint-disable-line')),
	s({trig = '^%s*// es$', regTrig = true}, t('// eslint-disable-next-line')),
	s('?:', fmt('{} ? {} : {}', {i(1, 'cond'), i(2, 'then'), i(3, 'else')}))
}
