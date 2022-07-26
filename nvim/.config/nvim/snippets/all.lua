return {
	    -- utils.pair("(", ")", neg, char_count_same),
	    -- utils.pair("{", "}", neg, char_count_same),
	    -- utils.pair("[", "]", neg, char_count_same),
	    -- utils.pair("<", ">", neg, char_count_same),
	    -- utils.pair("'", "'", neg, even_count),
	    -- utils.pair('"', '"', neg, even_count),
	    -- utils.pair("`", "`", neg, even_count),
     --
	    -- -- Use a function to execute any shell command and print its text.
	    -- s("bash", f(utils.bash, {}, "ls")),
     --
     --    -- current date
	    -- s({ trig = "ymd", name = "Current date", dscr = "Insert the current date" }, {
	    --     p(os.date, "%Y-%m-%d"),
	    -- }),
     --
	    -- s({trig="{,", wordTrig=false, hidden=true}, { t({"{","\t"}), i(1), t({"", "}"}) }),
}
