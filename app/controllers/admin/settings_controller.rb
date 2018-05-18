class Admin::SettingsController < AdminController
  def edit
    @form_object = SettingForm.new(setting: setting)
  end

  def update
    @form_object = SettingForm.new(setting_form_params)
    setting.attributes = @form_object.setting_attributes

    if @form_object.valid?(setting: setting)
      setting.save
      redirect_to [:admin, setting]
    else
      render :edit
    end
  end

  private

  def setting_form_params
    params.require(:setting_form).permit(
      :setting_name,
      :setting_description,
      :setting_primary_color,
      :setting_secondary_color
    )
  end
end
