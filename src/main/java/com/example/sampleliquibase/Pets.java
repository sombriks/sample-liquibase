package com.example.sampleliquibase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.persistence.EntityManager;
import java.util.List;


@RestController
@RequestMapping("/pets")
public class Pets {

    @Autowired
    private EntityManager em;

    @GetMapping
    public List<Pet> listPets(){
        return em.createQuery("select p from Pet p", Pet.class).getResultList();
    }
}
