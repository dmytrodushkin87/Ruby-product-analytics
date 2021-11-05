class ProductsController < ApplicationController
require 'csv'
	def product_import
		csv = Rails.root.join('public', 'prod.csv')
   		CSV.foreach(csv) do |row|
   			category=Category.find_by_category(row[3])
   			if category.present?
				a=Product.new
				a.category_id=category.id
				a.schemecode=row[0].to_i
				a.s_name=row[1]
				a.rating=row[2].to_i
				a.objective=row[4]
				a.clicks=0;
				a.save
			end
		end
	end

	def category_import
		csv = Rails.root.join('public', 'category.csv')
   		CSV.foreach(csv) do |row|
				a=Category.new
				a.category=row[0]
				a.save
		end
	end

	def disp_product
		begin
			product=Product.select("products.*,categories.category,count(products_users.user_id) as count").joins("left outer join products_users on products_users.product_id=products.id").joins("join categories on categories.id=products.category_id").group("products.id").order("count(products_users.user_id) desc,clicks desc")
			category=Category.all
			render :json => {:product => product,:category => category}
		rescue => e# StandardError
        	render :json => {:product => "error",:category => "error"}
        end
	end

	def ind_product
		if current_user!=nil
			product= params[:id]
			Product.where(:schemecode => product).update_all("clicks = clicks + 1")
			user=User.find(current_user.id)
			pro=Product.find_by_schemecode(product)
			user.products << pro unless user.products.include?(pro)
			@prod_desc=Category.select("products.*,categories.*").joins(:products).where("products.schemecode = ?", product).first
		else
			redirect_to root_path
		end
	end
end
