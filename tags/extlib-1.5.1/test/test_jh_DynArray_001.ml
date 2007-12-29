(*
 * ExtLib Testing Suite
 * Copyright (C) 2004 Janne Hellsten
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version,
 * with the special exception on linking described in file LICENSE.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *)

(* NOTE this is a copy of Skaller's trivial DynArray test.  Apparently
   he hit the nail on the head with a first try, since test_triv causes a
   segfault if you run Gc.major () after test_triv.  If you change the
   initial size of the DynArray to one or bigger, the crash does not
   occur. *)

open DynArray

let test_triv () =
  let a = make 0 in (* ZERO here causes a segfault later in GC??? *)
  let b = copy a in
  assert (length a == 0);
  assert (length b == 0);
  Gc.major ()

(* Failure reported by Jeff Henrikson.  Should be fixed in CVS
   already? JH 2005/Mar/01 *)
let test_regr_1 () = 
  for i = 0 to 30 do
    ignore (DynArray.of_array [||])
  done

let test () = 
  Util.run_test ~test_name:"jh_DynArray.triv" test_triv;
  Util.run_test ~test_name:"jh_DynArray.regr_1" test_regr_1

