return {
    s({ trig = '// es$', regTrig = true }, t('// eslint-disable-line')),
    s({ trig = '^%s*// es$', regTrig = true }, t('// eslint-disable-next-line')),
    s('?', fmt('{} ? {} : {}', { i(1, 'cond'), i(2, 'then'), i(3, 'else') })),
    s('f', fmt('({}) => {} ', { i(1, 'cond'), i(2, 'then') })),
    s('fu', fmt([[
{} function {}({}) {{
    {}
}}]], { c(3, {t'async', t""}), i(1, 'fn_name'), i(2, ''), i(4, '') })),
    s('test', fmt([[
test('{}', () => {{
const {{ container }} = render({});
{}
expect(something).toBe(true);
}});]],  { i(1, 'it should do a thing'), i(2, '<Component />'), i(0) })),
}
