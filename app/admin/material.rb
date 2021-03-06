ActiveAdmin.register Material do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


permit_params :title, :description, :subject, :level, :updated_by, :public_level

	form do |f|
	    inputs "Crear material" do
	        input :title
	        input :description
	        input :subject
	        input :level
		end
	    actions
	end

	index do
		column :title
		column :description		
		column :updated_by
		column :public_level
		column :subject
		column :level
		actions
	end

	filter :subject, as: :select
	filter :level, as: :select
	filter :updated_by


end
