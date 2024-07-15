# frozen_string_literal: true

class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  broadcasts_to :channel, target: 'all_memberships', partial: 'memberships/list_memberships'
  broadcasts_to :user, target: 'all_memberships_for_user', partial: 'memberships/list_memberships_for_user'
  broadcasts_to :user, target: 'all_channels_for_user', partial: 'memberships/list_channels_for_user'
  after_destroy_commit -> { broadcast_action_later_to(user, action: :append, target: 'all_channels_without_user', partial: 'memberships/list_channels_without_user', locals: { channel: channel, membership: nil }) }
  
end
