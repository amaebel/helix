; ——— Identifiers & Annexes
(identifier) @variable
;
; highlight annexes as builtins, which probably makes sense
(annex
  ; also highlight aliases
  (identifier)? @variable.builtin
  alias: (identifier)? @variable.other
  normalizer: (identifier)? @variable.other
) @variable.builtin

; ——— Functions & Parameters ———
;
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
;
; highlight identifiers used as functions
(application . (identifier) @variable.function (_))

; ——— Brackets ———
;
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

; ——— Delimiters ———
;
[
  ","
  ";"
  "."
] @punctuation.delimiter

; ——— Operators ———
;
[
  "="
  "#"
  ":"
  "@"
  "->"
  "→"
] @operator

; ——— Keywords ———
;
[
  "import"
  "plugin"
] @keyword.control.import
;
[
  "let"
  "axm"
] @keyword.storage.type
;
[
  "lam"
  "con"
  "fun"
  "Sigma"
] @keyword.function
;
[
  "where"
  "end"
  "extern"
] @keyword

; ——— Types
;
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
;
; highlight identifiers that appear where types or type level functions
; are expected
(_ type: (identifier) @type)
(_ type: (application (identifier) @type (_)) (_))
(_ type: (application (application (identifier) @type (_)) (_)) (_))
(_ type: (application (application (application (identifier) @type (_)) (_)) (_)) (_))

"return" @keyword.control

; ——— Literals ———
;
(int_literal) @constant.numeric
;
(char_literal) @constant.character
;
(string_literal) @string
;
[
  "tt"
  "ff"
] @constant.builtin

; ——— Comments ———
; doc comment markdown injection is handled in injections.scm
;
(line_comment) @comment.line
;
(block_comment) @comment.block
;
(doc_comment) @comment.line.documentation

