# frozen_string_literal: true

class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  broadcasts_to :channel, target: 'all_memberships', partial: 'memberships/list_memberships'
  broadcasts_to :user, target: 'all_memberships_for_user', partial: 'memberships/list_memberships_for_user'
end
