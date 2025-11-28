(identifier) @variable

; highlight parameters
(lam
  name: (identifier) @variable.function
  (pattern (identifier) @variable.parameter)*
  (pattern
    (pattern .(identifier) @variable.parameter))*
  (pattern (group (identifier) @variable.parameter))*)
(function_type
  (pattern (pattern (identifier) @variable.parameter)))
(function_type
  (pattern (group (identifier) @variable.parameter)))

; highlight identifiers used as functions
(application . (identifier) @variable.function (_))

; highlight annexes as builtins, which probably makes sense
(annex
  ; also highlight aliases
  (identifier)? @variable.builtin
  alias: (identifier)? @variable.other
  normalizer: (identifier)? @variable.other
) @variable.builtin

; highlight identifiers used as types or type level functions (with up to 4 arguments) as types
(_ type: (identifier) @type)
(_ type: (application (identifier) @type (_)) (_))
(_ type: (application (application (identifier) @type (_)) (_)) (_))
(_ type: (application (application (application (identifier) @type (_)) (_)) (_)) (_))

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

"return" @keyword.control

(int_literal) @constant.numeric

(char_literal) @constant.character

(string_literal) @string

(line_comment) @comment.line

(block_comment) @comment.block

(doc_comment) @comment.line.documentation
