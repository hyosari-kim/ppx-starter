This is ppx starter template for Ocaml ppx newbie (It's me..🙏)

# [😅 WIP..] Workflow
1. Check the AST syntax of the code you want to rewrite
   ```
    ocamlfind ppx_tools/dumpast -e "[%custom "hello"]"
   ```
2. Write ppx rewirter
   Use ppxlib.metaquate
3. Test the ppx in the Ocaml file
4. build ppx
5. Test in the ReScript file (check the compile result)

# Test ppx
You can test it in ocaml or rescript file.
1. Check how the ppx rewrites in Ocaml file.
   ```
   dune build
   
   ocamlc -desource _build/default/[ppx_applied_ocaml_file_path].pp.ml
   ```
   
2. To test using the rescript file, you must first build the ppx and make it executable.
    ```
    dune build
    ```
   Then link the generated executable file directly to `bsconfig.json`. And run ReScript compilation.

   ```
   yarn res:watch
   ```



reference: 
 - https://ppxlib.readthedocs.io/en/latest/
 - https://github.com/ocaml-ppx/ppxlib/tree/main/examples
