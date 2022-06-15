package com.fanfan.exam.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fanfan.exam.models.Gender;
import com.fanfan.exam.repositories.GenderRepository;

@Service
public class GenderService {
	
	@Autowired
	GenderRepository genRepo;
	
	public List<Gender> allGenders() {
        return genRepo.findAll();
    }
	
	// creates a book
    public Gender createGender(Gender b) {
        return genRepo.save(b);
    }
    // retrieves a book
    public Gender findGender(Long id) {
        Optional<Gender> optionalGender = genRepo.findById(id);
        if(optionalGender.isPresent()) {
            return optionalGender.get();
        } else {
            return null;
        }
    }
    public void deleteGender(Long id) {
		// TODO Auto-generated method stub
		genRepo.deleteById(id);
    }
		
		public Gender updateGender(Gender b) {
			return genRepo.save(b);
		}	

}
