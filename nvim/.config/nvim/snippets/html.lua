return {
    s({ trig = '!', name = 'html5' }, fmt([[
<!DOCTYPE html>
<html lang="en">
<head>
<title>{}</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
{}
    </head>
    <body>
    	    {}
</body>
</html>
]], { i(1), i(2), i(0) })),
}
