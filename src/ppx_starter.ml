open Ppxlib

let expand ~ctxt label =
  let loc = Expansion_context.Extension.extension_point_loc ctxt in
  match label with
  | value -> Ast_builder.Default.estring ~loc value
  | exception Not_found ->
    Location.raise_errorf ~loc "This is Error %s" label
  
let extension =
  Extension.V3.declare "greenlabs" Extension.Context.expression
  Ast_pattern.(single_expr_payload (estring __))
  expand

let rule = Ppxlib.Context_free.Rule.extension extension

let () = Driver.register_transformation ~rules:[rule] "greenlabs"
