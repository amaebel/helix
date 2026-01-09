; ——— Identifiers & Annexes
((identifier) @type
  (#match? @type "^[A-Z][_a-zA-Z]*"))
;
(identifier) @variable
;
(annex
  "%" @namespace
  module: (identifier) @namespace)
(annex
  name: (identifier) @variable.builtin)
(annex
  name: ((identifier) @type.builtin (#match? @type.builtin "^[A-Z][_a-zA-Z]*")))
(annex
  name: (identifier) @namespace
  subtag: (identifier) @variable.builtin)
(annex
  name: (identifier) @namespace
  subtag: ((identifier) @type.builtin (#match? @type.builtin "^[A-Z][_a-zA-Z]*")))

; ——— Functions & Parameters ———
;
(lam
  name: (identifier) @variable.function
  (pattern (identifier) @variable.parameter)*
  (pattern
    (pattern .(identifier) @variable.parameter))*
  (pattern (group (identifier) @variable.parameter))*
  (battern (identifier) @variable.parameter)*
  (battern
    (battern .(identifier) @variable.parameter))*
  (battern (group (identifier) @variable.parameter))*)
(pi
  (battern (battern (identifier) @variable.parameter))*
  (implicit (battern (identifier) @variable.parameter))*)
(pi
  (battern (group (identifier) @variable.parameter))*)
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
  "|"
  "$"
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
  "∪"
  "=>"
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
  "rec"
  "and"
  "axm"
] @keyword.storage.type
;
[
  "match"
  "with"
  "ret"
] @keyword.control
;
[
  "cfun"
  "ccon"
  "lam"
  "con"
  "fun"
  "lm"
  "cn"
  "fn"
] @keyword.function
;
[
  "where"
  "end"
  "extern"
] @keyword
;
[
  "inj"
] @keyword.operator
;
[
  "rule"
  "norm"
  "when"
] @keyword.directive

; ——— Types
;
(primitive) @type.builtin
;
; highlight identifiers that appear where types or type level functions
; are expected (with up to eight parameters)
(_ type: (identifier) @type)
(_ type: (application (identifier) @type (_)))
(_ type: (application (application (identifier) @type (_)) (_)))
(_ type: (application (application (application (identifier) @type (_)) (_)) (_)))
(_ type: (application (application (application (application (identifier) @type (_)) (_)) (_)) (_)))
(_ type: (application (application (application (application (application (identifier) @type (_)) (_)) (_)) (_)) (_)))
(_ type: (application (application (application (application (application (application (identifier) @type (_)) (_)) (_)) (_)) (_)) (_)))
(_ type: (application (application (application (application (application (application (application (identifier) @type (_)) (_)) (_)) (_)) (_)) (_)) (_)))
(_ type: (application (application (application (application (application (application (application (application (identifier) @type (_)) (_)) (_)) (_)) (_)) (_)) (_)) (_)))

; ——— Literals ———
;
(int_literal) @constant.numeric
;
(float_literal) @constant.numeric
;
(char_literal) @constant.character
;
(string_literal) @string
;
[
  "tt"
  "ff"
] @constant.builtin
;
; special "keywords"
((identifier) @keyword.control.return
  (#eq? @keyword.control.return "return"))
;
((identifier) @keyword.control.return
  (#eq? @keyword.control.return "yield"))
;
((identifier) @keyword.control.return
  (#eq? @keyword.control.return "continue"))
;

; ——— Comments ———
; doc comment markdown injection is handled in injections.scm
;
(line_comment) @comment.line
;
(block_comment) @comment.block
;
(doc_comment) @comment.line.documentation

