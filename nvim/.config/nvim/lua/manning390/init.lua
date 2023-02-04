local loadSet = {
    'manning390.set',
    'manning390.packer',
    'manning390.keymap',
    'manning390.autocmd',
    'manning390.telescope',
    'manning390.commands',
    'manning390.fn',
}
for _, v in pairs(loadSet) do
    local ok, _ = pcall(require, v)
    if not ok then
        print(l .. ' failed to load')
    end
end

