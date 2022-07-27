return {
   s('req', fmt('local {} = require\'{}\'{}',{ i(1, 'package'), rep(1), i(0) })),
   s('fn', fmt('function{}({}) {}end', { i(1), i(2), i(0)})),
}

