
#ifdef __cplusplus
extern "C" {
#endif
    // Markers for the start of the constructor list
    // This file must be the first file to be linked into the kernel
    void (*start_ctors[1])(void)
        __attribute__((section(".ctors"))) = { (void (*)())-1 };	/* XXX */
    void (*start_dtors[1])(void)
        __attribute__((section(".dtors"))) = { (void (*)())-1 };	/* XXX */


#if 0
    // Markers for the start of the constructor list
    // This file must be the first file to be linked into the kernel
    void (*__CTOR_LIST__[1])(void)
        __attribute__((section(".init_array"))) = { (void *)-1 };	/* XXX */
    void (*__DTOR_LIST__[1])(void)
        __attribute__((section(".fini_array"))) = { (void *)-1 };	/* XXX */
#endif

#ifdef __cplusplus
}
#endif
