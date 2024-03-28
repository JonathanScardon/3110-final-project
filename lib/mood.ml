open Data

let day = string_of_int (Unix.localtime (Unix.time ())).tm_mday
let month = string_of_int ((Unix.localtime (Unix.time ())).tm_mon + 1)
let year = string_of_int ((Unix.localtime (Unix.time ())).tm_year + 1900)
let curr_date = day ^ "-" ^ month ^ "-" ^ year

let rec happiness_log () =
  print_string "Rate your happiness 1-10: ";
  let happiness_lvl = read_line () in
  let hap_lvl_int = int_of_string happiness_lvl in
  if hap_lvl_int >= 1 && hap_lvl_int <= 10 then happiness_lvl
  else happiness_log ()

let see_history user =
  let header = "\nDate | Happiness | Mood" in
  print_string "Would you like to limit the history you see? (y/n) ";
  if read_line () = "y" then
    let () =
      print_string
        "How many recent entries would you like to see? (enter a number) "
    in
    let limit = int_of_string (read_line ()) in
    print_endline (header ^ get_data ("data/" ^ user ^ "_mood.csv") (Some limit))
  else print_endline (header ^ get_data ("data/" ^ user ^ "_mood.csv") None)
