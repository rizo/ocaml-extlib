(*
 * Options - functions for the option type
 * Copyright (C) 2003 Nicolas Cannasse
 * 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
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
 
(** Functions for the option type.

    Options are an Ocaml standard type that can be either [None] (undefined)
	or [Some x] where x can be any value. Options are widely used in Ocaml
	to represent undefined values (a little like NULL in C, but in a type
	and memory safe way). This module add few functions for working with
	options.
*)

val may : ('a -> unit) -> 'a option -> unit
(** [may f (Some x)] will call [f x] and [may f None] will no nothing. *)

val map : ('a -> 'b) -> 'a option -> 'b option
(** [map f (Some x)] returns [Some (f x)] and [map None] returns [None]. *)

val default : 'a -> 'a option -> 'a
(** [default x (Some v)] returns [v] and [default x None] returns [x]. *)

val is_none : 'a option -> bool
(** [is_none None] returns [true] or [false] either. *)

val is_some : 'a option -> bool
(** [is_some (Some x)] returns [true] or [false] either. *)

val get : 'a option -> 'a
(** [get (Some x)] returns [x] and [get None] raises [No_value]. *)

exception No_value
(** raised when calling [get None]. *)