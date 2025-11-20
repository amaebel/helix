(identifier) @variable

(annex) @variable

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"

  "‹"
  "›"
  "«"
  "»"
  "<<"
  ">>"
  "<"
  ">"
] @punctuation.bracket

[
  ","
  ";"
  "."
] @punctuation.delimiter

[
  "="
  "#"
  ":"
  "%"
  "@"
  "->"
  "→"
] @operator

[
  "import"
  "plugin"
] @keyword.control.import

[
  "let"
  "axm"
] @keyword.storage.type

[
  "lam"
  "con"
  "fun"
  "Sigma"
] @keyword.function

[
  "extern"
  "where"
]

[
  "tt"
  "ff"
] @constant.builtin

[
  "Cn"
  "Fn"
  "Nat"
  "Bool"
  "Idx"
  "Type"
  "Univ"
  "*"
  "□"
  "⊥" ".bot"
  "⊤" ".top"
] @type.builtin


(num_literal) @constant.numeric

(char_literal) @constant.character

(string_literal) @string

(line_comment) @comment.line

(block_comment) @comment.block

(doc_comment) @comment.line.documentation
