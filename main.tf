resource vault_identity_entity "this" {
  for_each = var.users
  name = each.key
}

resource vault_identity_entity_alias "this" {
  for_each        = var.users
  name            = each.value
  mount_accessor  = var.mount_accessor
  canonical_id    = vault_identity_entity.this[each.key].id
}