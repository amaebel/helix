(identifier) @variable

(lam
  name: (identifier) @variable.function
  (pattern (identifier) @variable.parameter)*
  (pattern
    (pattern .(identifier) @variable.parameter))*
  (pattern (group (identifier) @variable.parameter))*)

(application . (identifier) @variable.function (_))

(annex (identifier)? @variable.builtin
  alias: (identifier)? @variable.other
  normalizer: (identifier)? @variable.other
) @variable.builtin

(_ type: (identifier) @type)

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
  "where"
  "end"
  "extern"
] @keyword

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


(int_literal) @constant.numeric

(char_literal) @constant.character

(string_literal) @string

(line_comment) @comment.line

(block_comment) @comment.block

(doc_comment) @comment.line.documentation
