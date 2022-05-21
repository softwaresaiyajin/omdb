import Swinject

public class DI {
    private static var synchronizedResolver: Resolver?
    private static var assembler: Assembler?

    public class func initialize(assemblies: [Assembly]) {
        assembler = Assembler(assemblies)
    }
    
    public static var isInitialized: Bool {
        assembler != nil
    }
    
    public class func resolve<Service>(_ serviceType: Service.Type) -> Service {
        getSynchronizedResolver().resolve(serviceType)!
    }
    
    public class func resolve<Service>(
        _ serviceType: Service.Type,
        name: String
    ) -> Service {
        getSynchronizedResolver().resolve(serviceType, name: name)!
    }
    
    public class func resolve<Service, Arg>(
        _ serviceType: Service.Type,
        name: String,
        argument: Arg
    ) -> Service {
        getSynchronizedResolver().resolve(serviceType, name: name, argument: argument)!
    }
    
    public class func resolve<Service, Arg>(
        _ serviceType: Service.Type,
        argument: Arg
    ) -> Service {
        getSynchronizedResolver().resolve(serviceType, argument: argument)!
    }
    
    public class func resolve<Service, Arg, Arg2>(
        _ serviceType: Service.Type,
        argument: Arg,
        argument2: Arg2
    ) -> Service {
        getSynchronizedResolver().resolve(serviceType, arguments: argument, argument2)!
    }
    
    public class func resolve<Service, Arg, Arg2, Arg3>(
        _ serviceType: Service.Type,
        argument: Arg,
        argument2: Arg2,
        argument3: Arg3
    ) -> Service {
        getSynchronizedResolver().resolve(serviceType, arguments: argument, argument2, argument3)!
    }
    
    public class func resolve<Service, Arg, Arg2, Arg3, Arg4>(
        _ serviceType: Service.Type,
        argument: Arg,
        argument2: Arg2,
        argument3: Arg3,
        argument4: Arg4
    ) -> Service {
        getSynchronizedResolver().resolve(
            serviceType,
            arguments: argument, argument2, argument3, argument4
        )!
    }
    
    public class func resolve<Service, Arg, Arg2, Arg3, Arg4, Arg5>(
        _ serviceType: Service.Type,
        argument: Arg,
        argument2: Arg2,
        argument3: Arg3,
        argument4: Arg4,
        argument5: Arg5
    ) -> Service {
        getSynchronizedResolver().resolve(
            serviceType,
            arguments: argument, argument2, argument3, argument4, argument5
        )!
    }
    
    public class func resolve<Service, Arg, Arg2, Arg3, Arg4, Arg5, Arg6>(
        _ serviceType: Service.Type,
        argument: Arg,
        argument2: Arg2,
        argument3: Arg3,
        argument4: Arg4,
        argument5: Arg5,
        argument6: Arg6
    ) -> Service {
        getSynchronizedResolver().resolve(
            serviceType,
            arguments: argument, argument2, argument3, argument4, argument5, argument6
        )!
    }
    
    public class func resolve<Service, Arg, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7>(
        _ serviceType: Service.Type,
        argument: Arg,
        argument2: Arg2,
        argument3: Arg3,
        argument4: Arg4,
        argument5: Arg5,
        argument6: Arg6,
        argument7: Arg7
    ) -> Service {
        getSynchronizedResolver().resolve(
            serviceType,
            arguments: argument, argument2, argument3, argument4, argument5, argument6, argument7
        )!
    }
    
    public class func resolve<Service, Arg, Arg2>(
        _ serviceType: Service.Type,
        name: String,
        argument: Arg,
        argument2: Arg2
    ) -> Service {
        getSynchronizedResolver().resolve(
            serviceType,
            name: name,
            arguments: argument, argument2
        )!
    }
    
    public class func resolve<Service, Arg, Arg2, Arg3>(
        _ serviceType: Service.Type,
        name: String,
        argument: Arg,
        argument2: Arg2,
        argument3: Arg3
    ) -> Service {
        getSynchronizedResolver().resolve(
            serviceType,
            name: name,
            arguments: argument, argument2, argument3
        )!
    }
    
    public class func resolve<Service, Arg, Arg2, Arg3, Arg4>(
        _ serviceType: Service.Type,
        name: String,
        argument: Arg,
        argument2: Arg2,
        argument3: Arg3,
        argument4: Arg4
    ) -> Service {
        getSynchronizedResolver().resolve(
            serviceType,
            name: name,
            arguments: argument, argument2, argument3, argument4
        )!
    }
    
    private class func getSynchronizedResolver() -> Resolver {
        guard let assembler = self.assembler else {
            fatalError("DI: Assembler not initialized")
        }
        
        guard let synchronizedResolver = self.synchronizedResolver else {
            self.synchronizedResolver = (assembler.resolver as! Container).synchronize()
            return getSynchronizedResolver()
        }
        
        return synchronizedResolver
    }
}

//MARK: DI+Name
extension DI {
    public class func resolve<Service, Name>(
        _ serviceType: Service.Type,
        name: Name
    ) -> Service where Name: RawRepresentable, Name.RawValue == String {
        resolve(serviceType, name: name.rawValue)
    }
    
    public class func resolve<Service, Name, A1>(
        _ serviceType: Service.Type,
        name: Name,
        argument a1: A1
    ) -> Service where Name: RawRepresentable, Name.RawValue == String {
        resolve(serviceType, name: name.rawValue, argument: a1)
    }
    
    public class func resolve<Service, Name, A1, A2>(
        _ serviceType: Service.Type,
        name: Name,
        arguments a1: A1, _ a2: A2
    ) -> Service where Name: RawRepresentable, Name.RawValue == String {
        resolve(serviceType, name: name.rawValue, argument: a1, argument2: a2)
    }
    
    public class func resolve<Service, Name, A1, A2, A3>(
        _ serviceType: Service.Type,
        name: Name,
        arguments a1: A1, _ a2: A2, _ a3: A3
    ) -> Service where Name: RawRepresentable, Name.RawValue == String {
        resolve(serviceType, name: name.rawValue, argument: a1, argument2: a2, argument3: a3)
    }
}
