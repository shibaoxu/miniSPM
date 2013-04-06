package org.minispm.sale.service;

import org.minispm.sale.dao.CustomerDao;
import org.minispm.sale.entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

/**
 * User: shibaoxu
 * Date: 12-12-18
 * Time: 下午9:38
 */
@Service
@Transactional(readOnly = true)
public class CustomerService {
    private CustomerDao customerDao;

//    public List<Customer> findAll(){
//        return customerDao.findAll();
//    }

    public Page<Customer> findAll(int pageNumber, String searchName){
        return customerDao.findAll( buildSpecification(searchName),buildPageRequest(pageNumber));
    }

    public List<Customer> findAll(String searchName){
        return  customerDao.findAll(buildSpecification(searchName));
    }

    public Customer getById(String id){
        return customerDao.findOne(id);
    }

    @Transactional(readOnly = false)
    public void remove(String id){
        customerDao.delete(id);
    }

    @Transactional(readOnly = false)
    public Customer save(Customer customer){
        return customerDao.save(customer);
    }

    public CustomerDao getCustomerDao() {
        return customerDao;
    }

    private Specification<Customer> buildSpecification(final String name){
        return new Specification<Customer>() {
            @Override
            public Predicate toPredicate(Root<Customer> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                return cb.like(root.<String>get("name"), "%" + name + "%");
            }
        };
    }

    private PageRequest buildPageRequest(int pageNumber){
         return new PageRequest(pageNumber - 1, 10 , new Sort(Sort.Direction.DESC, "name"));
    }

    @Autowired
    public void setCustomerDao(CustomerDao customerDao) {
        this.customerDao = customerDao;
    }
}
