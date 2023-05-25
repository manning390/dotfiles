return {
    s({ trig = '!', name = "svelte" }, fmt([[
<script>
	{}
</script>
{}
]], { i(1), i(2) })),
    s('mount', fmt('onMount(async () => {});', { i(0) })),
    s('f', fmt('({}) => {} ', { i(1, 'cond'), i(2, 'then') })),
    s('fu', fmt([[
{} function {}({}) {{
    {}
}}]], { i(3, 'async'), i(1, 'fn_name'), i(2, ''), i(4, '') })),
}
