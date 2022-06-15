package com.fanfan.exam.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fanfan.exam.models.Gender;

@Repository
public interface GenderRepository extends CrudRepository<Gender, Long> {

	List<Gender> findAll();
	
}
