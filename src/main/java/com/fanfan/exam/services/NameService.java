package com.fanfan.exam.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fanfan.exam.models.Name;
import com.fanfan.exam.repositories.NameRepository;

@Service
public class NameService {
	
	@Autowired
	NameRepository nameRepo;
	
	public List<Name> allNames() {
        return nameRepo.findAll();
    }
	
	// creates a book
    public Name createName(Name b) {
        return nameRepo.save(b);
    }
    // retrieves a book
    public Name findName(Long id) {
        Optional<Name> optionalName = nameRepo.findById(id);
        if(optionalName.isPresent()) {
            return optionalName.get();
        } else {
            return null;
        }
    }
    public void deleteName(Long id) {
		// TODO Auto-generated method stub
		nameRepo.deleteById(id);
    }
		
		public Name updateName(Name b) {
			return nameRepo.save(b);
		}	
	
	

}
