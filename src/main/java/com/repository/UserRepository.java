package com.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.entity.UserEntity;

@Repository
public interface UserRepository extends MongoRepository<UserEntity, String> {

    // Custom method to find a user by email (useful for checking duplicate emails during signup)
    UserEntity findByEmail(String email);
}