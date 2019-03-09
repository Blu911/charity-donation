package pl.blu911.oddam.service;

import pl.blu911.oddam.domain.Category;

import java.util.List;

public interface CategoryService {

    List<Category> findByParentId(Long id);

}
