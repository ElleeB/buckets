module ActivitiesHelper

  def past_due(activity)
    if activity.countdown < 0
      tag.p "This activity is past due!"
    else
      tag.p "#{activity.countdown} days until this drop is due!"
    end
  end
end
