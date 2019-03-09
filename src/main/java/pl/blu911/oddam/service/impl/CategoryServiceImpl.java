package pl.blu911.oddam.service.impl;

import org.springframework.stereotype.Service;
import pl.blu911.oddam.domain.Category;
import pl.blu911.oddam.repository.CategoryRepository;
import pl.blu911.oddam.service.CategoryService;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {
    private final CategoryRepository categoryRepository;

    public CategoryServiceImpl(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Override
    public List<Category> findByParentId(Long id) {
        return categoryRepository.findAllByParentId(id);
    }
}
