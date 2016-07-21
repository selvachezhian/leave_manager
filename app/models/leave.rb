class Leave < ApplicationRecord
  belongs_to :user

  after_commit :trigger_slack_notification

  scope :between, -> (start_date, end_date) { where('start_date >= ? and end_date <= ?', start_date, end_date) }

  def editable?(user)
    user_id == user.try(:id)
  end

  def trigger_slack_notification
    notifier = Slack::Notifier.new 'https://hooks.slack.com/services/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', channel: '#leave-dashboard', username: user.slack_detail.user_name
    notifier.ping 'Hello default'
  end
end
