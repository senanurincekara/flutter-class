//1
abstract class InterfaceRepository<T> {
  Future<T?> getAll();

  Future<void> insertItem({required T object});

  Future<bool> isDataAvaliable();
}


//when creating local repositories and db services by implementing this class, 
//we should override this three methods