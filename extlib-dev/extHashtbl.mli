(* 
 * ExtHashtbl - extra functions over hashtables.
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
 
(** Extra functions over hashtables. *)

module Hashtbl :
  (** The wrapper module *)
  sig

	type ('a,'b) t
	(** The type of a hashtable. *)

	(** {6 New Functions} *)

	val exists : ('a,'b) t -> 'a -> bool
	(** [exists h k] returns true is at least one item with key [k] is
		found in the hashtable. *)

	val keys : ('a,'b) t -> 'a Enum.t
	(** returns an enumeration of all the keys of an hashtable.
	    If the key is in the Hashtable multiple times, all occuransces
	    will be returned  *)

	val values : ('a,'b) t -> 'b Enum.t
	(** returns an enumeration of all the values of an hashtable. *)

	val enum : ('a, 'b) t -> ('a * 'b) Enum.t
	(** returns an enumeration of (key,value) pairs of an hashtable. *)

	val of_enum : ('a * 'b) Enum.t -> ('a, 'b) t
	(** create an hashtable from a (key,value) enumeration. *)

	val find_default : ('a,'b) t -> 'a -> 'b -> 'b
	(** find a binding for the key, and return a default
	    value if not found *)

	val remove_all : ('a,'b) t -> 'a -> unit
	(** remove all bindings for the given key *)

	val map : ('b -> 'c) -> ('a,'b) t -> ('a,'c) t
	(** [map f x] creates a new hashtable with the same
	    keys as [x], but with the function [f] applied to
		all the values *)

	(** {6 Older Functions} *)

	(** Please refer to the Ocaml Manual for documentation of theses
		functions. (note : functor support removed to avoid code
		duplication). *)

	val create : int -> ('a, 'b) t
	val clear : ('a, 'b) t -> unit
	val add : ('a, 'b) t -> 'a -> 'b -> unit
	val copy : ('a, 'b) t -> ('a, 'b) t
	val find : ('a, 'b) t -> 'a -> 'b
	val find_all : ('a, 'b) t -> 'a -> 'b list
	val mem : ('a, 'b) t -> 'a -> bool
	val remove : ('a, 'b) t -> 'a -> unit
	val replace : ('a, 'b) t -> 'a -> 'b -> unit
	val iter : ('a -> 'b -> unit) -> ('a, 'b) t -> unit
	val fold : ('a -> 'b -> 'c -> 'c) -> ('a, 'b) t -> 'c -> 'c
	val hash : 'a -> int
	external hash_param : int -> int -> 'a -> int = "hash_univ_param" "noalloc"

  end