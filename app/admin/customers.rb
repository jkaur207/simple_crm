ActiveAdmin.register Customer do
  permit_params :full_name, :phone_number, :email, :notes, :image

  # Filters for searching customers
  filter :full_name
  filter :email
  filter :phone_number
  filter :created_at
  filter :has_image, as: :boolean # Filter by image presence

  # Index page with customer details and image preview
  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email
    column :notes
    column "Image" do |customer|
      if customer.image.attached?
        image_tag url_for(customer.image), width: 50, height: 50
      else
        "No Image"
      end
    end
    column :created_at
    actions
  end

  # Show page for detailed customer info
  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email
      row :notes
      row :image do |customer|
        if customer.image.attached?
          image_tag url_for(customer.image), width: 150
        else
          "No Image"
        end
      end
    end
    active_admin_comments
  end

  # Form for adding/editing customers
  form do |f|
    f.inputs do
      f.input :full_name
      f.input :phone_number
      f.input :email
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end
end
