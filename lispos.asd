(in-package :asdf)

(defsystem "lispos"
  :description "Lisp operating system."
  :version "0"
  :author "Sylvia Harrington <sylvia.harrington28@gmail.com>"
  :licence "MIT"
  :depends-on (#:nibbles #:cl-ppcre #:iterate
               #:alexandria #:closer-mop
               #:trivial-gray-streams)
  :serial t
  :components ((:file "compiler/cross")
               (:file "compiler/cross-boot")
               (:file "compiler/package")
               (:file "system/data-types")
               (:file "system/parse")
               (:file "system/backquote")
               (:file "system/reader")
               (:file "system/uuid")
               (:file "compiler/compiler")
               (:file "compiler/environment")
               (:file "compiler/cross-compile")
               (:file "compiler/lap")
               (:file "compiler/lap-x86")
               (:file "compiler/lap-arm64")
               (:file "compiler/ast")
               (:file "compiler/ast-generator")
               (:file "compiler/keyword-arguments")
               (:file "compiler/simplify-arguments")
               (:file "compiler/pass1")
               (:file "compiler/inline")
               (:file "compiler/lift")
               (:file "compiler/simplify")
               (:file "compiler/constprop")
               (:file "compiler/kill-temps")
               (:file "compiler/value-aware-lowering")
               (:file "compiler/lower-environment")
               (:file "compiler/lower-special-bindings")
               (:file "compiler/simplify-control-flow")
               (:file "compiler/blexit")
               (:file "compiler/transforms")
               (:file "compiler/dynamic-extent")
               (:file "compiler/type-check")
               (:file "compiler/backend/backend")
               (:file "compiler/backend/instructions")
               (:file "compiler/backend/cfg")
               (:file "compiler/backend/analysis")
               (:file "compiler/backend/dominance")
               (:file "compiler/backend/convert-ast")
               (:file "compiler/backend/multiple-values")
               (:file "compiler/backend/ssa")
               (:file "compiler/backend/passes")
               (:file "compiler/backend/debug")
               (:file "compiler/backend/register-allocation")
               (:file "compiler/backend/canon")
               (:file "compiler/backend/x86-64/x86-64")
               (:file "compiler/backend/x86-64/target")
               (:file "compiler/backend/x86-64/codegen")
               (:file "compiler/backend/x86-64/builtin")
               (:file "compiler/backend/x86-64/misc")
               (:file "compiler/backend/x86-64/object")
               (:file "compiler/backend/x86-64/cons")
               (:file "compiler/backend/x86-64/memory")
               (:file "compiler/backend/x86-64/number")
               (:file "compiler/backend/x86-64/simd")
               (:file "compiler/backend/arm64/arm64")
               (:file "compiler/backend/arm64/target")
               (:file "compiler/backend/arm64/codegen")
               (:file "compiler/backend/arm64/builtin")
               (:file "compiler/backend/arm64/misc")
               (:file "compiler/backend/arm64/object")
               (:file "compiler/backend/arm64/number")
               (:file "tools/cold-generator2/build-unicode")
               (:file "tools/cold-generator2/build-pci-ids")
               (:file "tools/cold-generator2/util")
               (:file "tools/cold-generator2/environment")
               (:file "tools/cold-generator2/load")
               (:file "tools/cold-generator2/eval")
               (:file "tools/cold-generator2/serialize")
               (:file "tools/cold-generator2/write")
               (:file "tools/cold-generator2/clos")
               (:file "tools/cold-generator2/cold-generator")
               (:file "tools/cold-generator2/x86-64")
               (:file "tools/cold-generator2/arm64")))
