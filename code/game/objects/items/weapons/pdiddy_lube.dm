/*
 * P. Diddy Lube
 */

/obj/item/weapon/reagent_containers/food/condiment/pdiddy_lube
	name = "P. Diddy Lube"
	desc = "A legendary bottle of baby oil and high-grade lubricant. Essential for elite parties and maximum velocity."
	icon = 'icons/obj/items.dmi'
	icon_state = "lube"
	item_state = "lube"
	volume = 100
	slot_flags = SLOT_BELT | SLOT_POCKET
	w_class = 2

/obj/item/weapon/reagent_containers/food/condiment/pdiddy_lube/New()
	..()
	reagents.add_reagent("lube", 100)

/obj/item/weapon/reagent_containers/food/condiment/pdiddy_lube/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/weapon/gun/energy/kirkinator))
		to_chat(user, "<span class='notice'>You slather the P. Diddy Lube all over the Kirkinator, charging it with forbidden power!</span>")
		playsound(get_turf(src), 'sound/effects/bin_open.ogg', 50, 1)
		playsound(get_turf(src), 'sound/vox/yourself.ogg', 60, 1)
		// Apply Kirkinator buff mechanics
		I.name = "Lubed Kirkinator"
		I.force += 15
		qdel(src)
		return
	return ..()

/obj/item/weapon/reagent_containers/food/condiment/pdiddy_lube/afterattack(atom/target, mob/user, proximity, params)
	. = ..()
	if(proximity && ismob(target))
		playsound(get_turf(src), 'sound/effects/can_open1.ogg', 40, 1)
		to_chat(user, "<span class='warning'>You generously apply the P. Diddy Lube to [target]. They slip and slide away into the night!</span>")
