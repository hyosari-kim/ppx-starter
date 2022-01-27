This is ppx starter template for Ocaml ppx newbie (It's me... )

There are two ways to test ppx :
1. Ocaml test file
   You can use the ocaml test file to see how ppx rewrites.
   When you want to see the rewrited code
   ```
   ocamlc -desource _build/default/[ppx_applied_ocaml_file_path].pp.ml
   ```
   
2. ReScript test file
   To test using the rescript file, you must first build the ppx and make it executable.
   Then link the generated executable directly to bsconfig.json. And run ReScript compilation.

   ```
   dune build

   yarn res:watch
   ```

workflow
1. Check the AST syntax of the code you want to rewrite
   ```
    ocamlfind ppx_tools/dumpast -e "[%custom "hello"]"
   ```
2. Write ppx rewirter
   Use ppxlib.metaquate
3. Test the ppx in the Ocaml file
4. build ppx
5. Test in the ReScript file (check the compile result)

reference: 
 - https://ppxlib.readthedocs.io/en/latest/
 - https://github.com/ocaml-ppx/ppxlib/tree/main/examples