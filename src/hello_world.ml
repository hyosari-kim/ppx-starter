Lwt_main.run (Lwt_io.printf "Hello, world!\n")

let () = print_string [%get_env "foo"]
type t = {
  a: string; b:int
} [@@deriving show]