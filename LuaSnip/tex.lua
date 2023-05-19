-- Include this `in_mathzone` function at the start of a snippets file...
local in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
-- Then pass the table `{condition = in_mathzone}` to any snippet you want to
-- expand only in math contexts.

return {
 --Greek letters:
 s(
  {trig = "alpha"},
  { 
    t("\\alpha")
  }
),

 s(
  {trig = "Alpha"},
  { 
    t("\\Alpha")
  }
),

 s(
  {trig = "beta"},
  { 
    t("\\beta")
  }
),

 s(
  {trig = "Beta"},
  { 
    t("\\Beta")
  }
),

 s(
  {trig = "gamma"},
  { 
    t("\\gamma")
  }
),

 s(
  {trig = "Gamma"},
  { 
    t("\\Gamma")
  }
),

 s(
  {trig = "delta"},
  { 
    t("\\delta")
  }
),
 
 s(
  {trig = "Delta"},
  { 
    t("\\Delta")
  }
),

 s(
  {trig = "epsilon"},
  { 
    t("\\epsilon")
  }
),

 s(
  {trig = "Epsilon"},
  { 
    t("\\Epsilon")
  }
),

 s(
  {trig = "zeta"},
  { 
    t("\\zeta")
  }
),

 s(
  {trig = "Zeta"},
  { 
    t("\\Zeta")
  }
),

 s(
  {trig = "eta"},
  { 
    t("\\eta")
  }
),

 s(
  {trig = "Eta"},
  { 
    t("\\Eta")
  }
),

 s(
  {trig = "theta"},
  { 
    t("\\theta")
  }
),

 s(
  {trig = "Theta"},
  { 
    t("\\Theta")
  }
),

 s(
  {trig = "iota"},
  { 
    t("\\iota")
  }
),

 s(
  {trig = "Iota"},
  { 
    t("\\Iota")
  }
),

 s(
  {trig = "kappa"},
  { 
    t("\\kappa")
  }
),

 s(
  {trig = "Kappa"},
  { 
    t("\\Kappa")
  }
),

 s(
  {trig = "lambda"},
  { 
    t("\\lambda")
  }
),

 s(
  {trig = "Lambda"},
  { 
    t("\\Lambda")
  }
),

 s(
  {trig = "mu"},
  { 
    t("\\mu")
  }
),

 s(
  {trig = "Mu"},
  { 
    t("\\Mu")
  }
),

 s(
  {trig = "nu"},
  { 
    t("\\nu")
  }
),

 s(
  {trig = "Nu"},
  { 
    t("\\Nu")
  }
),

 s(
  {trig = "xi"},
  { 
    t("\\xi")
  }
),

 s(
  {trig = "Xi"},
  { 
    t("\\Xi")
  }
),

 s(
  {trig = "omicron"},
  { 
    t("\\omicron")
  }
),

 s(
  {trig = "Omicron"},
  { 
    t("\\Omicron")
  }
),

 s(
  {trig = "pi"},
  { 
    t("\\pi")
  }
),

 s(
  {trig = "Pi"},
  { 
    t("\\Pi")
  }
),

 s(
  {trig = "rho"},
  { 
    t("\\rho")
  }
),

 s(
  {trig = "Rho"},
  { 
    t("\\Rho")
  }
),


 s(
  {trig = "sigma"},
  { 
    t("\\sigma")
  }
),


 s(
  {trig = "Sigma"},
  { 
    t("\\Sigma")
  }
),

 s(
  {trig = "tau"},
  { 
    t("\\tau")
  }
),

 s(
  {trig = "Tau"},
  { 
    t("\\Tau")
  }
),


 s(
  {trig = "upsilon"},
  { 
    t("\\upsilon")
  }
),


 s(
  {trig = "Upsilon"},
  { 
    t("\\Upsilon")
  }
),

 s(
  {trig = "phi"},
  { 
    t("\\phi")
  }
),


 s(
  {trig = "Phi"},
  { 
    t("\\Phi")
  }
),


 s(
  {trig = "chi"},
  { 
    t("\\chi")
  }
),

 s(
  {trig = "Chi"},
  { 
    t("\\Chi")
  }
),

 s(
  {trig = "psi"},
  { 
    t("\\psi")
  }
),


 s(
  {trig = "Psi"},
  { 
    t("\\Psi")
  }
),


 s(
  {trig = "omega"},
  { 
    t("\\omega")
  }
),

 s(
  {trig = "Omega"},
  { 
    t("\\Omega")
  }
),

--Enviroments:

s({trig="eq", dscr="A LaTeX equation environment"},
  fmt( -- The snippet code actually looks like the equation environment it produces.
    [[
      \begin{equation}
          <>
      \end{equation}
    ]],
    -- The insert node is placed in the <> angle brackets
    { i(1) },
    -- This is where I specify that angle brackets are used as node positions.
    { delimiters = "<>" }
  )
),


--Math mode:
--frac
s({trig = "frac"},
  fmta(
    "\\frac{<>}{<>}",
    {
      i(1),
      i(2),
    }
  ),
  {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
),

--sum
s({trig = "sum"},
  fmta(
    "\\sum_{<>}^{<>}",
    {
      i(1),
      i(2),
    }
  ),
  {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
),

--exp
s({trig = "exp"},
  fmta(
    "\\exp{\\left( <> \\right)}",
    {
      i(1),
    }
  ),
  {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
),

--sqrt
s({trig = "sqrt"},
  fmta(
    "\\sqrt{<>}",
    {
      i(1),
    }
  ),
  {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
),

--indize
s({trig = "s", wordTrig=false},
  fmta(
    "_{<>}",
    {
      i(1),
    }
  ),
  {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
),

s({trig = "txt", wordTrig=false},
  fmta(
    "\\text{<>}",
    {
      i(1),
    }
  ),
  {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
),

s({trig = "^", wordTrig=false},
  fmta(
    "^{<>}",
    {
      i(1),
    }
  ),
  {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
),

}
