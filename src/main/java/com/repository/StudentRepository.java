package com.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import com.entity.StudentEntity;

public interface StudentRepository extends MongoRepository<StudentEntity, String> {
    @Query("{ 'firstName': { $regex: '^?0', $options: 'i' } }")
    List<StudentEntity> findByFirstNameStartingWith(String prefix);
}
