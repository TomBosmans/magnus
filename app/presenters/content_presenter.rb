class ContentPresenter < ApplicationPresenter
  def created_at
    format_date(super)
  end

  def updated_at
    format_date(super)
  end

  def action_buttons
    {}
  end

  private

  def format_date(date)
    date.to_formatted_s(:long_ordinal)
  end
end
