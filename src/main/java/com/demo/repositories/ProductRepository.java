package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Product;


@Repository("productRepository")
public interface ProductRepository extends CrudRepository<Product, Integer>{
		
	@Query(value="select * from product where status = :status order by id desc limit :n" , nativeQuery = true)
	public List<Product> latestProducts(@Param("status") boolean status , @Param("n") int n);

	
	@Query(value="select * from product where status = :status and featured = :featured order by id desc limit :n" , nativeQuery = true)
	public List<Product> featuredProducts(@Param("featured") boolean featured ,@Param("status") boolean status , @Param("n") int n);
	
	@Query(value="select * from product where status = :status and category_id = :category_id and id != :id limit :n" , nativeQuery = true)
	public List<Product> relatedProducts(@Param("category_id") int categoryId  ,@Param("status") boolean status ,@Param("id") int id, @Param("n") int n);
	
	@Query(value="select Product from product where status = :status and name like %:keyword%" , nativeQuery = true)
	public List<Product> search(@Param("status") boolean status , @Param("keyword") String keyword);
	
	
}
