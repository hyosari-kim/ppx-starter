open Ppxlib

let expand ~ctxt label _ _ =
  let loc = Expansion_context.Extension.extension_point_loc ctxt in
  match label with
  | value -> let test = Ast_builder.Default.estring ~loc value in [%expr [%e test] ^ " some suffix"] 
  | exception Not_found ->
    Location.raise_errorf ~loc "This is Error %s" label


let extension =
  Extension.V3.declare "greenlabs" Extension.Context.expression
  Ast_pattern.(pstr (pstr_eval (pexp_constant (pconst_string __ __ __ )) nil ^:: nil))
  expand

let rule = Ppxlib.Context_free.Rule.extension extension

let () = Driver.register_transformation ~rules:[rule] "greenlabs"
